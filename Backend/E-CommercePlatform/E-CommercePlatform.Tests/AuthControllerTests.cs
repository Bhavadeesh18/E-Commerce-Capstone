using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using FluentAssertions;
using Database.Context;
using Common.DTOs;

namespace E_CommercePlatform.Tests
{
    public class AuthControllerTests : IClassFixture<WebApplicationFactory<Program>>
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly HttpClient _client;

        public AuthControllerTests(WebApplicationFactory<Program> factory)
        {
            _factory = factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureServices(services =>
                {
                    // Remove the app's ApplicationDbContext registration
                    var descriptor = services.SingleOrDefault(
                        d => d.ServiceType == typeof(DbContextOptions<EcommerceDbContext>));
                    if (descriptor != null)
                        services.Remove(descriptor);

                    // Add ApplicationDbContext using an in-memory database for testing
                    services.AddDbContext<EcommerceDbContext>(options =>
                    {
                        options.UseInMemoryDatabase("TestDb" + Guid.NewGuid());
                    });
                });
            });

            _client = _factory.CreateClient();
        }

        [Fact]
        public async Task Register_ValidUser_ReturnsSuccess()
        {
            // Arrange
            var registerDto = new RegisterDto
            {
                Username = "testuser",
                Email = "test@example.com",
                Password = "Test123!"
            };

            var json = JsonSerializer.Serialize(registerDto);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            // Act
            var response = await _client.PostAsync("/api/Auth/register", content);

            // Assert
            response.IsSuccessStatusCode.Should().BeTrue();
        }

        [Fact]
        public async Task Login_ValidCredentials_ReturnsToken()
        {
            // Arrange - First register a user
            var registerDto = new RegisterDto
            {
                Username = "logintest",
                Email = "login@example.com",
                Password = "Test123!"
            };

            var registerJson = JsonSerializer.Serialize(registerDto);
            var registerContent = new StringContent(registerJson, Encoding.UTF8, "application/json");
            await _client.PostAsync("/api/Auth/register", registerContent);

            // Now login
            var loginDto = new LoginDto
            {
                Email = "login@example.com",
                Password = "Test123!"
            };

            var loginJson = JsonSerializer.Serialize(loginDto);
            var loginContent = new StringContent(loginJson, Encoding.UTF8, "application/json");

            // Act
            var response = await _client.PostAsync("/api/Auth/login", loginContent);

            // Assert
            response.IsSuccessStatusCode.Should().BeTrue();
            var responseContent = await response.Content.ReadAsStringAsync();
            responseContent.Should().Contain("token");
        }

        [Fact]
        public async Task Register_InvalidEmail_ReturnsBadRequest()
        {
            // Arrange
            var registerDto = new RegisterDto
            {
                Username = "testuser",
                Email = "invalid-email",
                Password = "Test123!"
            };

            var json = JsonSerializer.Serialize(registerDto);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            // Act
            var response = await _client.PostAsync("/api/Auth/register", content);

            // Assert
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.BadRequest);
        }
    }
}