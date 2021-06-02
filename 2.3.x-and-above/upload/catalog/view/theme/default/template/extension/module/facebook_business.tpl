<!-- Copyright (c) Facebook, Inc. and its affiliates. -->
<!-- All rights reserved. -->

<!-- This source code is licensed under the license found in the -->
<!-- LICENSE file in the root directory of this source tree. -->
<script type="text/javascript">
  // we are using this flag to determine if the pixel
  // is successfully added to the header
  window.isFacebookPixelInHeaderAdded = 1;
  window.isFacebookPixelAdded = 1;
</script>

<script type="text/javascript">
  function facebook_loadScript(url, callback) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    if(script.readyState) {  // only required for IE <9
      script.onreadystatechange = function() {
        if (script.readyState === "loaded" || script.readyState === "complete") {
          script.onreadystatechange = null;
          if (callback) {
            callback();
          }
        }
      };
    } else {  //Others
      if (callback) {
        script.onload = callback;
      }
    }

    script.src = url;
    document.getElementsByTagName("head")[0].appendChild(script);
  }
</script>

<script type="text/javascript">
  (function() {
    var enableCookieBar = '<?php echo $facebook_cookie_bar_status ?>';
    if (enableCookieBar == '1') {
      facebook_loadScript("catalog/view/javascript/facebook_business/cookieconsent.min.js");

      // loading the css file
      var css = document.createElement("link");
      css.setAttribute("rel", "stylesheet");
      css.setAttribute("type", "text/css");
      css.setAttribute(
        "href",
        "catalog/view/theme/css/facebook_business/cookieconsent.min.css");
      document.getElementsByTagName("head")[0].appendChild(css);

      window.addEventListener("load", function(){
        function setConsent() {
          fbq(
            'consent',
            this.hasConsented() ? 'grant' : 'revoke'
          );
        }
        window.cookieconsent.initialise({
          palette: {
            popup: {
              background: '#237afc'
            },
            button: {
              background: '#fff',
              text: '#237afc'
            }
          },
          cookie: {
            name: fbq.consentCookieName
          },
          type: 'opt-out',
          showLink: false,
          content: {
            allow: '<?php echo $cookie_bar_opt_in; ?>',
            deny: '<?php echo $cookie_bar_opt_out; ?>',
            header: '<?php echo $cookie_bar_header; ?>',
            message: '<?php echo $cookie_bar_description; ?>'
          },
          layout: 'basic-header',
          location: true,
          revokable: true,
          onInitialise: setConsent,
          onStatusChange: setConsent,
          onRevokeChoice: setConsent
        }, function (popup) {
          // If this isn't open, we know that we can use cookies.
          if (!popup.getStatus() && !popup.options.enabled) {
            popup.setStatus(cookieconsent.status.dismiss);
          }
        });
      });
    }
  })();
</script>

<script type="text/javascript">
  (function() {
    !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
    n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
    document,'script','https://connect.facebook.net/en_US/fbevents.js');

    var enableCookieBar = '<?php echo $facebook_cookie_bar_status ?>';
    if (enableCookieBar == '1') {
      fbq.consentCookieName = 'fb_cookieconsent_status';

      (function() {
        function getCookie(t){var i=("; "+document.cookie).split("; "+t+"=");if(2==i.length)return i.pop().split(";").shift()}
        var consentValue = getCookie(fbq.consentCookieName);
        fbq('consent', consentValue === 'dismiss' ? 'grant' : 'revoke');
      })();
    }

    <?php if ($facebook_pixel_id) { ?>
      // system auto generated facebook_pixel.js, DO NOT MODIFY
      pixel_script_filename = 'catalog/view/javascript/facebook_business/facebook_pixel_3_1_2.js';
      // system auto generated facebook_pixel.js, DO NOT MODIFY
      facebook_loadScript(
        pixel_script_filename,
        function() {
          var params = <?php echo $facebook_pixel_params; ?>;
          _facebookAdsExtension.facebookPixel.init(
            '<?php echo $facebook_pixel_id; ?>',
            <?php echo $facebook_pixel_pii; ?>,
            params);
          <?php if ($facebook_pixel_event_params) { ?>
            _facebookAdsExtension.facebookPixel.firePixel(
              JSON.parse('<?php echo $facebook_pixel_event_params; ?>'));
          <?php } ?>
        });
    <?php } ?>
  })();
</script>

<script type="text/javascript">
  // we are using this flag to determine if the customer chat
  // is successfully added to the header
  window.isFacebookCustomerChatInHeaderAdded = 1;
  window.isFacebookCustomerChatAdded=1;
</script>

<?php if ($facebook_messenger_enabled == 'true') { ?>
<!-- Facebook JSSDK -->
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId            : '',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v10.0'
    });
  };

  (function(d, s, id){
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) {return;}
      js = d.createElement(s); js.id = id;
      js.src = "https://connect.facebook.net/<?php echo $facebook_customization_locale; ?>/sdk/xfbml.customerchat.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<div
  id="fb-customerchat-header"
  class="fb-customerchat"
  attribution="fbe_opencart"
  page_id="<?php echo $facebook_page_id; ?>">
</div>
<?php } ?>