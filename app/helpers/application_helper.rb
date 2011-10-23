module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end

=begin

  def jquery_block_tag(content)
    javascript_tag "jQuery(function(){#{content}})"
  end

  def disable_conflict
    js =<<EOS
      $j = jQuery.noConflict();
EOS
  end

  def contact_us
    js =<<EOS
      $j("#contact_us_menu_container").click(function() {
        $j("#dialog").dialog({ title: 'Contact Form'});
        });
EOS
  end

  def clickable
    js =<<EOS
      $j(".clickable").click(function(){
      window.location = $j(this).find("a").attr("href");
      return false;
    });
EOS
  end

    def submenu_showhide_onload
      js =<<EOS
      var subOptions = $('ul.submenu');
      console.log(subOptions);
      subOptions.hide();
      var currentPage = (document.location.href);
      console.log(currentPage);
      if (currentPage.indexOf("synergy") > 0)
        {subOptions.filter("#synergy").show();}
      else if (currentPage.indexOf("big") > 0)
        {subOptions.filter("#big").show();}
      else
        {}
      console.log(currentPage.indexOf("big"));
  EOS
    end

    def submenu_showhide_onclick
      js =<<EOS
        var subOptions = $('div.menu_item > div');
        console.log(subOptions);

        var menuItem = $('div.menu_item a.top_nav');
        console.log(menuItem);

        $('div.menuItem a.top_nav').click(function () {
          subOptions.hide();
          console.log(this);
          subOptions.filter(this.hash);

        });

  EOS
    end

    def monthly_showhide_onclick
      js =<<EOS
        $(document).ready(function () {
          $('#monthly_image').click(function() {
            $("h1").toggle();
            $("p").toggle();
          })
        });
  EOS
    end
  =end

    def big_payback_showhide_onclick
      js =<<EOS

        $j = jQuery.noConflict();

        $j('#monthly_image_1').click(function() {
          $j('#bp_starting_option').hide();
          $j('#bp_monthly_savings_sample_option').show();
          $j('#monthly_image_1').hide();
          $j('#monthly_image_2').show();
        });

        $j('#monthly_image_2').click(function() {
          $j('#bp_monthly_savings_sample_option').hide();
          $j('#bp_monthly_savings_graph').show();
          $j('#monthly_image_2').hide();
          $j('#monthly_image_3').show();
        });

        $j('#monthly_image_3').click(function() {
          $j('#bp_monthly_savings_graph').hide();
          $j('#bp_starting_option').show();
          $j('#monthly_image_3').hide();
          $j('#monthly_image_1').show();
        });
  EOS
    end

    def consolidation_examples_buttons
      js =<<EOS

        $j = jQuery.noConflict();

        $j('#consolidation_examples_button_1').click(function() {
          $j('#consolidation_examples_button_1').addClass('active');
          $j('#consolidation_examples_button_2').removeClass('active');
          $j('#consolidation_examples_button_3').removeClass('active');
          $j('#consolidation_examples_image_1').show();
          $j('#consolidation_examples_image_2').hide();
          $j('#consolidation_examples_image_3').hide();
        });

        $j('#consolidation_examples_button_2').click(function() {
          $j('#consolidation_examples_button_1').removeClass('active');
          $j('#consolidation_examples_button_2').addClass('active');
          $j('#consolidation_examples_button_3').removeClass('active');
          $j('#consolidation_examples_image_1').hide();
          $j('#consolidation_examples_image_2').show();
          $j('#consolidation_examples_image_3').hide();
        });

        $j('#consolidation_examples_button_3').click(function() {
          $j('#consolidation_examples_button_1').removeClass('active');
          $j('#consolidation_examples_button_2').removeClass('active');
          $j('#consolidation_examples_button_3').addClass('active');
          $j('#consolidation_examples_image_1').hide();
          $j('#consolidation_examples_image_2').hide();
          $j('#consolidation_examples_image_3').show();
        });

  EOS
    end

    def active_main_menu_css(controller_menu_item)
      selected = case controller_menu_item
      when "home"
        true if params[:controller] == 'home' && params[:action] == 'index'
      when "part_truckload"
        true if params[:controller] == 'pages' && params[:action] == 'part_truckload'
      when "synergy_consolidation"
        true if params[:controller] == 'pages' && params[:action] == 'synergy_consolidation'
      when "consolidation_examples"
        true if params[:controller] == 'pages' && params[:action].include?('consolidation_examples')
      when "corporate_alignment"
        true if params[:controller] == 'pages' && params[:action] == 'corporate_alignment'
      when "ship_green"
        true if params[:controller] == 'pages' && params[:action] == 'ship_green'
      when "think"
        true if params[:controller] == 'pages' && params[:action] == 'think'
      when "big_payback"
        true if params[:controller] == 'pages' && params[:action] == 'big_payback'
      when "efficiency_consolidator"
        true if params[:controller] == 'pages' && params[:action] == "efficiency_consolidator"
      when "truckload_express"
        true if params[:controller] == 'pages' && params[:action] == 'truckload_express'
      else
        false
      end
      selected ? {:class => "active"} : {}
    end

  end
=end

end
