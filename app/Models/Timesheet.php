<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timesheet extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'task_name',
        'date',
        'hours',
        'user_id',
        'project_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function scopeFilter($query, $filters)
    {
        foreach ($filters as $key => $value) {
            if (in_array($key, ['date', 'hours', 'user_id', 'project_id'])) {
                $query->where($key, $value);
            } elseif ($key === 'task_name') {
                $query->where($key, 'LIKE', '%' . $value . '%');
            }
        }

        return $query;
    }
}
