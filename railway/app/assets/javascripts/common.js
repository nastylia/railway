function changeLinkName(item) {
  if (!item.hasClass('cancel')) {
    item.html('Cancel');
    item.addClass('cancel');
  } else {
    item.html('Edit');
    item.removeClass('cancel');
  }
}

function toggleClasses(form, title) {
  form.toggle();
  title.toggle();
}