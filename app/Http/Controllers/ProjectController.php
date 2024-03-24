<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'department' => 'required|max:255',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
            'status' => 'required',
        ]);

        $project = Project::create($validatedData);
        return response()->json($project, 201);
    }

    public function show(Project $project)
    {
        return $project;
    }

    public function index(Request $request)
    {
        return Project::filter($request->filter)->get();
    }

    public function update(Request $request)
    {
        $project = Project::find($request->id);
        if (!$project) {
            return response()->json(['error' => 'Project not found'], 404);
        }

        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'department' => 'required|max:255',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
            'status' => 'required',
        ]);

        $project->update($validatedData);
        return response()->json($project, 200);
    }

    public function destroy(Request $request)
    {
        $project = Project::find($request->id);
        if (!$project) {
            return response()->json(['error' => 'Project not found'], 404);
        }

        // Detach the relationships
        $project->users()->detach();
        $project->timesheets()->delete();

        $project->delete();
        return response()->json(['success' => 'Deleted successfully'], 200);
    }
}
