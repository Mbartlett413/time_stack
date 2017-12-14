# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.find_or_initialize_by(id: 1, status: 'NEW') do |s|
  s.save!
end
Status.find_or_initialize_by(id: 2, status: 'SUBMITTED') do |s|
  s.save!
end
Status.find_or_initialize_by(id: 3, status: 'APPROVED') do |s|
  s.save!
end
Status.find_or_initialize_by(id: 4, status: 'REJECTED') do |s|
  s.save!
end
Status.find_or_initialize_by(id: 5, status: 'EDIT') do |s|
  s.save!
end

Role.find_or_initialize_by(id: 1, name: "User") do |n|
  n.save!
end
Role.find_or_initialize_by(id: 2, name: "CustomerManager") do |n|
  n.save!
end
Role.find_or_initialize_by(id: 3, name: "ProjectManager") do |n|
  n.save!
end
Role.find_or_initialize_by(id: 4, name: "Admin") do |n|
  n.save!
end

weeks_with_no_status = TimeEntry.where(status_id: nil).select(:week_id).collect { |w| w.week_id }.uniq

weeks_with_no_status.each do |w_id|
  if !w_id.nil?
    TimeEntry.where(week_id: w_id).each do |te|
      te.status_id 	= Week.find(w_id).status_id
      te.approved_by 	= Week.find(w_id).approved_by
      te.approved_date 	= Week.find(w_id).approved_date
      te.save!
    end
  end
end
Feature.find_or_initialize_by(id: 1, feature_type: "Easy Automation", feature_data:"Automatic date updation") do |f|
  f.save!
end
Feature.find_or_initialize_by(id: 2, feature_type: "Employee Time Entry", feature_data:"Automatic date updation") do |f|
  f.save!
end
Feature.find_or_initialize_by(id: 3, feature_type: "Submission and Approval", feature_data:"Automatic date updation") do |f|
  f.save!
end
Feature.find_or_initialize_by(id: 4, feature_type: "Flexible Reports", feature_data:"Automatic date updation") do |f|
  f.save!
end
Feature.find_or_initialize_by(id: 5, feature_type: "Optional Payroll System Integration", feature_data:"Automatic date updation") do |f|
  f.save!
end

CaseStudy.find_or_initialize_by(id: 1, case_study_name: "Resourse Stack", case_study_data: "Nitin study") do |cs|
  cs.save!
end
CaseStudy.find_or_initialize_by(id: 2, case_study_name: "JSM Consulting", case_study_data: "Nitin study") do |cs|
  cs.save!
end



