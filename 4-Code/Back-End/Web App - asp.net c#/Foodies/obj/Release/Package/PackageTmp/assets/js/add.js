// Get all plus and minus buttons
const plusBtns = document.querySelectorAll('.plus-btn');
const minusBtns = document.querySelectorAll('.minus-btn');

// For each plus button, add a click event listener
plusBtns.forEach(function  (btn) {
    btn.addEventListener('click', function () {
        // Get the current value of the quantity
        let currentVal = parseInt(btn.parentElement.querySelector('.quantity-value').textContent);
        // Increment the value by 1
        currentVal += 1;
        // Set the new value
        btn.parentElement.querySelector('.quantity-value').textContent = currentVal;
    });
});

// For each minus button, add a click event listener
minusBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
        // Get the current value of the quantity
        let currentVal = parseInt(btn.parentElement.querySelector('.quantity-value').textContent);
        // Decrement the value by 1, but don't go below 1
        currentVal = Math.max(currentVal - 1,1);
        // Set the new value
        btn.parentElement.querySelector('.quantity-value').textContent = currentVal;
    });
});
