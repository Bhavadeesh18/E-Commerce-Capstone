using Common.DTOs;
using Common.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace E_CommercePlatform.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentService _paymentService;

        public PaymentController(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        [HttpPost("process")]
        public async Task<IActionResult> ProcessPayment([FromBody] PaymentDto paymentDto)
        {
            try
            {
                var result = await _paymentService.ProcessPaymentAsync(paymentDto);
                
                if (result.Success)
                    return Ok(result);
                else
                    return BadRequest(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new PaymentResultDto
                {
                    Success = false,
                    Message = ex.Message
                });
            }
        }

        [HttpPost("refund")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> RefundPayment([FromBody] RefundDto refundDto)
        {
            try
            {
                var result = await _paymentService.RefundPaymentAsync(refundDto.TransactionId, refundDto.Amount);
                
                if (result)
                    return Ok("Refund processed successfully");
                else
                    return BadRequest("Refund failed");
            }
            catch (Exception ex)
            {
                return BadRequest($"Refund failed: {ex.Message}");
            }
        }
    }

    public class RefundDto
    {
        public string TransactionId { get; set; }
        public decimal Amount { get; set; }
    }
}