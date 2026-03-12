const taskInput =document.getElementById('taskInput');
const addBtn = document.getElementById('addBtn');
const taskList = document.getElementById('tasklist');


function addTask() {
    const taskText = taskInput.value.trim();
    if (taskText === "")  return;

    const li = document.createElement('li');
    li.textContent = taskText;

    li.addEventListener('click', () => {
        li.classList.toggle('done');

    });

    const deleteBtn = document.createElement('button');
    deleteBtn.textContent = '❌';
    deleteBtn.addEventListener('click', () => {
        taskList.removeChild(li);

    });

    li.appendChild(deleteBtn);
    taskList.appendChild(li);

    taskInput.value = '';

}

taskInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') addTask();
});
