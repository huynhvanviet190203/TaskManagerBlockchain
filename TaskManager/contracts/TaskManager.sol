// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskManager {
    struct Task {
        uint id;
        string description;
        address createdBy;
        bool isCompleted;
        uint createdAt;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount = 0;

    event TaskCreated(uint id, string description, address createdBy);
    event TaskCompleted(uint id, address completedBy);
    event TaskDeleted(uint id, address deletedBy);

    function createTask(string memory _description) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _description, msg.sender, false, block.timestamp); // Lưu thời gian tạo
        emit TaskCreated(taskCount, _description, msg.sender);
    }

    function completeTask(uint _id) public {
        Task storage task = tasks[_id];
        require(task.createdBy == msg.sender, "Only creator can complete the task");
        task.isCompleted = true;
        emit TaskCompleted(_id, msg.sender);
    }

    function getTask(uint _id) public view returns (uint, string memory, address, bool, uint) {
        Task memory task = tasks[_id];
        return (task.id, task.description, task.createdBy, task.isCompleted, task.createdAt); // Trả về thời gian tạo
    }

    function deleteTask(uint _id) public {
        Task storage task = tasks[_id];
        require(task.createdBy == msg.sender, "Only creator can delete the task");
        delete tasks[_id]; // Xóa task khỏi mapping
        emit TaskDeleted(_id, msg.sender);
    }
    


}
