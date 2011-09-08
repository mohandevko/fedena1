var initExampleFields = function() {
  jQuery(".example-field").each(function() {
    jQuery(this).example(jQuery(this).attr("title"));
  });
};

var initRateables = function() {
  jQuery('.rateable').rateit({step: 1, resetable: false}).
    bind('rated', function (event, value) { $(this).find('input').val(value); });
};

jQuery("#new-skill").each(function() {
  jQuery('.new-skills-input').data('new-skill-template', jQuery('.new-skill-input').last().clone());
  
  jQuery(this).click(function(event) {
    event.preventDefault();
    
    jQuery('.new-skills-input').append(jQuery('.new-skills-input').data('new-skill-template').clone());
    
    initExampleFields();
    initRateables();
  });
});
