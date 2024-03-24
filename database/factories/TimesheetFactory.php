<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Timesheet>
 */
class TimesheetFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'task_name' => $this->faker->sentence,
            'date' => $this->faker->date($format = 'Y-m-d', $max = 'now'),
            'hours' => $this->faker->numberBetween($min = 1, $max = 8),
        ];
    }
}
