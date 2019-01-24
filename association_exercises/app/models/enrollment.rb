# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint(8)        not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
  belongs_to :user,  #method name
    primary_key: :id, #the PK references the PK of users
    foreign_key: :student_id, #this key is from enrolls
    class_name: :User
  

  belongs_to (:course), { #method name
    primary_key: :id, #the PK references the PK of users
    foreign_key: :course_id, #this key is from enrolls
    class_name: :Course
  }
end
