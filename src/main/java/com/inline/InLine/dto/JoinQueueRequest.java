package com.inline.InLine.dto;

import jakarta.validation.constraints.NotBlank;

public record JoinQueueRequest(@NotBlank String customerName) {
}
