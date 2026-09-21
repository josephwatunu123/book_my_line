package com.inline.InLine.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record CreateQueueRequest(@NotBlank String name, @NotNull @Min(1) Integer averageServiceMinutes) {
}
