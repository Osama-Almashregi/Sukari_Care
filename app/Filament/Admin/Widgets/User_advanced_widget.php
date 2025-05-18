<?php

namespace App\Filament\Admin\Resources\UserResource\Widgets;

use App\Models\User;
use EightyNine\FilamentAdvancedWidget\AdvancedStatsOverviewWidget as BaseWidget;
use EightyNine\FilamentAdvancedWidget\AdvancedStatsOverviewWidget\Stat;

class User_advanced_widget extends BaseWidget
{
    protected function getStats(): array
    {
        $totalUsers = User::count();
        $totalDoctors = User::where('role', 'doctor')->count();
        $this_week = User::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count();

        return [
            Stat::make('عدد المستخدمين', $totalUsers)
                ->icon('heroicon-o-user-group')
                // ->backgroundColor('success')
                ->progressBarColor('success')
                ->iconBackgroundColor('success')
                ->textColor('success', 'success', 'info')
                ->chartColor('success')
                // ->descriptionIcon('heroicon-o-chevron-up', 'before')
                ->descriptionColor('success')
            ,

           Stat::make('عدد الاطباء', $totalDoctors)
                ->icon('heroicon-o-users')
                // ->backgroundColor('success')
                ->progressBarColor('success')
                ->iconBackgroundColor('success')
                ->textColor('success', 'success', 'info')
                ->chartColor('success')
                // ->description('The users in this period')
                // ->descriptionIcon('heroicon-o-chevron-up', 'before')
                ->descriptionColor('success')
            , 
             // ->descriptionColor('primary'),
        ];
    }
}