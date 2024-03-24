<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'department',
        'start_date',
        'end_date',
        'status',
    ];

    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function timesheets()
    {
        return $this->hasMany(Timesheet::class);
    }

    public function scopeFilter($query, $filters)
    {
        foreach ($filters as $key => $value) {
            if (in_array($key, ['start_date', 'end_date', 'status'])) {
                $query->where($key, $value);
            } elseif (in_array($key, ['name', 'department'])) {
                $query->where($key, 'LIKE', '%' . $value . '%');
            }
        }

        return $query;
    }
}
