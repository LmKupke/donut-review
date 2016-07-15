function showVendorForm() {
  var $formValue = $('#donut_vendor_id')[0];
  if ($formValue.selectedIndex == 1) {
    $('.vendor-form').show();
  } else {
    $('.vendor-form').hide();
  }
}
