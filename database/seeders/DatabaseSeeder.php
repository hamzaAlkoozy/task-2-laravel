<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Project;
use App\Models\Timesheet;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Disable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // Truncate tables
        DB::table('timesheets')->truncate();
        DB::table('project_user')->truncate();
        DB::table('projects')->truncate();
        DB::table('users')->truncate();

        // Enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        // Users
        $defaultPassword = 12345678;

        $user1 = User::factory([
            'email' => 'hamza@gmail.com',
            'password' => $defaultPassword
        ])->create();

        $user2 = User::factory([
            'email' => 'john@gmail.com',
            'password' => $defaultPassword
        ])->create();

        // Projects
        $user1Projects = Project::factory(3)->create();
        $user2Projects = Project::factory(6)->create();

        $user1->projects()->attach($user1Projects->pluck('id'));
        $user2->projects()->attach($user2Projects->pluck('id'));

        // Timesheets - This code creates 10 Timesheet records for each User.
        // Each Timesheet is associated with a random Project that the User is attached to.
        foreach ($user1Projects as $project) {
            Timesheet::factory(10)->create(['user_id' => $user1->id, 'project_id' => $project->id]);
        }

        foreach ($user2Projects as $project) {
            Timesheet::factory(10)->create(['user_id' => $user2->id, 'project_id' => $project->id]);
        }
    }
}
