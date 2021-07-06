import Rails from "@rails/ujs";
var checkBoxes = document.querySelectorAll(".form-check-input");
var form = document.querySelector('form');
for (const check of checkBoxes) {
  check.addEventListener( 'change', function() {
    Rails.fire(form, 'submit');
  });
}
