<?php

namespace App\Http\Controllers;

use App\Models\Timesheet;
use Illuminate\Http\Request;

class TimesheetController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'task_name' => 'required|max:255',
            'date' => 'required|date',
            'hours' => 'required|integer|min:1',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
        ]);

        $timesheet = Timesheet::create($validatedData);
        return response()->json($timesheet, 201);
    }

    public function show(Timesheet $timesheet)
    {
        return $timesheet;
    }

    public function index(Request $request)
    {
        return Timesheet::filter($request->filter)->get();
    }

    public function update(Request $request)
    {
        $timesheet = Timesheet::find($request->id);
        if (!$timesheet) {
            return response()->json(['error' => 'Timesheet not found'], 404);
        }

        $validatedData = $request->validate([
            'task_name' => 'required|max:255',
            'date' => 'required|date',
            'hours' => 'required|integer|min:1',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
        ]);

        $timesheet->update($validatedData);
        return response()->json($timesheet, 200);
    }

    public function destroy(Request $request)
    {
        $timesheet = Timesheet::find($request->id);
        if (!$timesheet) {
            return response()->json(['error' => 'Timesheet not found'], 404);
        }

        $timesheet->delete();
        return response()->json(['success' => 'Deleted successfully'], 200);
    }
}
