function showVendorForm() {
  var formValue = $('#donut_vendor_id')[0].value;
  if (formValue === "") {
    $('.vendor-form').show();
  } else {
    $('.vendor-form').hide();
  }
}
