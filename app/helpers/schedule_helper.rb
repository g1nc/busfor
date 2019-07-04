module ScheduleHelper
  def schedule_badges(schedule_by_days)
    return badge_html.html_safe if schedule_by_days.count == 7

    schedule_by_days.map { |day_number| badge_html(day_number) }.join.html_safe
  end

  private

  def badge_html(day_number = 7)
    badge(%w[пн вт ср чт пт сб вс ежедневно].fetch(day_number), :light)
  end
end
