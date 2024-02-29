const addBtn = document.querySelector('.add-btn');
const popup = document.querySelector('.popup');
const closeBtn = document.querySelector('.close-btn');

function showPopup(event) {
    event.preventDefault();
    popup.style.display = 'flex';
    // Change background color randomly
    const colors = ['#F9D188', '#E9F1A4', '#B99EF7', '#5BD6FA', '#F4AA85'];
    const randomColor = colors[Math.floor(Math.random() * colors.length)];
    popup.querySelector('.popup-content').style.backgroundColor = randomColor;
}

function hidePopup(event) {
    event.preventDefault();
    popup.style.display = 'none';
}

addBtn.addEventListener('click', showPopup);
closeBtn.addEventListener('click', hidePopup);