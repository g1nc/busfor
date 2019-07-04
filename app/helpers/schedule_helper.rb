module ScheduleHelper
  def schedule_badges(schedule_by_days)
    return badge_html.html_safe if schedule_by_days.count == 7

    schedule_by_days.map { |day_number| badge_html(day_number) }.join.html_safe
  end

  private

  def badge_html(day_number = nil)
    weekday = { 0 => 'пн', 1 => 'вт', 2 => 'ср', 3 => 'чт', 4 => 'пт', 5 => 'сб', 6 => 'вс' }
    "<span class='badge badge-light'>#{weekday.fetch(day_number, 'eжедневно')}</span>"
  end
end
