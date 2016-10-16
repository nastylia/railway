$(document).ready(function() {
  $('a.edit_train').click(function(e) {
    e.preventDefault();

    var train_id;
    var form;
    var title;

    train_id = $(this).data('trainId');

    form = $('#edit_train_' + train_id);
    title = $('#train_title_' + train_id);

    changeLinkName($(this));
    toggleClasses(form, title);

  });
});