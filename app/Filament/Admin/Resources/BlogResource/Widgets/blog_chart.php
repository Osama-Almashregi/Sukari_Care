<?php

namespace App\Filament\Admin\Resources\BlogResource\Widgets;

use App\Models\Blog; // تأكد من استيراد نموذج المدونة
use EightyNine\FilamentAdvancedWidget\AdvancedChartWidget;

class Blog_chart extends AdvancedChartWidget
{
    protected static ?string $heading = 'Blog Posts Created';  
    protected static string $color = 'info';
    protected static ?string $icon = 'heroicon-o-chart-bar';
    protected static ?string $iconColor = 'info';
    protected static ?string $iconBackgroundColor = 'info';
    protected static ?string $label = 'Monthly users chart';

    protected static ?string $badge = 'new';
    protected static ?string $badgeColor = 'success';
    protected static ?string $badgeIcon = 'heroicon-o-check-circle';
    protected static ?string $badgeIconPosition = 'after';
    protected static ?string $badgeSize = 'xs';

    protected function getData(): array
    {
        // جلب بيانات المدونات حسب الشهر
        $blogsData = Blog::selectRaw('COUNT(*) as count, MONTH(created_at) as month')
            ->groupBy('month')
            ->orderBy('month')
            ->pluck('count', 'month')
            ->toArray();

        // ملء البيانات للأشهر الفارغة
        $data = array_fill(1, 12, 0);
        foreach ($blogsData as $month => $count) {
            $data[$month] = $count;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Blogs Created',
                    'data' => array_values($data), // القيم الشهرية
                    'backgroundColor' => 'rgba(54, 162, 235, 0.2)',
                    'borderColor' => 'rgba(54, 162, 235, 1)',
                    'borderWidth' => 1,
                ],
            ],
            'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        ];
    }

    protected function getType(): string
    {
        return 'bar'; // يمكنك استخدام 'scatter' أو 'line' حسب الحاجة
    }
}