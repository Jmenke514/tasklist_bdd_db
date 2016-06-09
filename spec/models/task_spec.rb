require 'rails_helper'
require 'task'

RSpec.describe Task, type: :model do
  it "can be created" do
    expect{Task.new}.to_not raise_error
    # expect{Task.make_new_task("take dogs out", "around the corner")}.to_not raise_error
  end

  it "has a title and description" do
    task = Task.create!(title: "take dogs out", description: "around the corner")
    expect(task).to be_kind_of(Task)
  end

  it "can list all Task records" do
    task1 = Task.create(title: "take dogs out", description: "around the corner")
    task2 = Task.create(title: "take dogs out tomorrow", description: "around the corner")
    task3 = Task.create(title: "take dogs out on Monday", description: "around the corner")
    task4 = Task.create(title: "take dogs out Tuesday", description: "around the corner")
    tasks = Task.all
    #expect(tasks.length).to eq 4
    expect(tasks).to match_array([task4, task2, task1, task3])
    p tasks
    #TODO figure out why id's populate not from 1
  end
  it "can be marked as done" do
    task = Task.create(title: "take dogs out", description: "around the corner")
    expect(task.set_done).to eq true
  end

  it "can list all records that are done" do
    task1 = Task.create(title: "take dogs out", description: "around the corner")
    task1.set_done
    task2 = Task.create(title: "take dogs out tomorrow", description: "around the corner")
    task2.set_done
    task3 = Task.create(title: "take dogs out on Monday", description: "around the corner")
    task4 = Task.create(title: "take dogs out Tuesday", description: "around the corner")
    tasks_done = Task.all.where("done = true")
    expect(tasks_done).to match_array([task1, task2])
  end

  it "can list all records that are not done" do
    task1 = Task.create(title: "take dogs out", description: "around the corner")
    task1.set_done
    task2 = Task.create(title: "take dogs out tomorrow", description: "around the corner")
    task2.set_done
    task3 = Task.create(title: "take dogs out on Monday", description: "around the corner")
    task4 = Task.create(title: "take dogs out Tuesday", description: "around the corner")
    tasks_notdone = Task.all.where("done = false")
    expect(tasks_notdone).to match_array([task3, task4])
  end

  it "can update title of a record given id" do
    task1 = Task.create(title: "take dogs out", description: "around the corner")
    task1.update_title("take dogs to the park", 1)
    expect(task1.title).to eq "take dogs to the park"
  end

end
