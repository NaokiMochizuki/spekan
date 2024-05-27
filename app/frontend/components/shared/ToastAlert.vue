<template>
</template>

<script>
  import { toast } from 'vue3-toastify'
  import 'vue3-toastify/dist/index.css'
  export default {
    name: 'ToastAlert',
    data(){
      return{
      }
    },
    methods: {
      showSuccessToast(title, msg){
        this.successToast(
          `<strong class=\' me-auto\'>${title}</strong>` +
          `<div class=\'toast-body\'>${msg}</div>`,
          true,
          'auto',
          true,
          true,
          'bounce',
          3000,
          'top-right'
        )
      },
      showInfoToast(title, msg){
        this.infoToast(
          `<strong class=\' me-auto\'>${title}</strong>` +
          `<div class=\'toast-body\'>${msg}</div>`,
          true,
          'auto',
          true,
          true,
          'bounce',
          3000,
          'top-right'
        )
      },
      showWarningToast(title, msg){
        this.warningToast(
          `<strong class=\' me-auto\'>${title}</strong>` +
          `<div class=\'toast-body\'>${msg}</div>`,
          true,
          'auto',
          true,
          true,
          'bounce',
          3000,
          'top-right'
        )
      },
      showErrorToast(title, msg){
        this.errorToast(
          `<strong class=\' me-auto\'>${title}</strong>` +
          `<div class=\'toast-body\'>${msg}</div>`,
          true,
          'auto',
          true,
          true,
          'bounce',
          3000,
          'top-right'
        )
      },
      toster(text, dangerouslyhtmlstring, theme, icon, hideProgressBar, transition, autoclose, position, delay, closeOnClick, newestOnTop) {
        text = text || '';
        dangerouslyhtmlstring = dangerouslyhtmlstring || false;
        theme = theme || 'auto';
        icon = icon || false;
        hideProgressBar = hideProgressBar || false;
        transition = transition || null;
        autoclose = autoclose || null;
        position = position || null;
        delay = delay !== undefined ? delay : 1000;
        closeOnClick = closeOnClick !== undefined ? closeOnClick : false;
        newestOnTop = newestOnTop !== undefined ? newestOnTop : true;

        toast.success(String(text), {
          theme: theme,
          dangerouslyHTMLString: dangerouslyhtmlstring,
          icon: icon,
          hideProgressBar: hideProgressBar,
          transition: transition,
          autoClose: autoclose,
          position: position,
          delay: delay,
          closeOnClick: closeOnClick,
          newestOnTop: newestOnTop
        });
      },
      successToast(text, dangerouslyHTMLString, theme, icon, hideProgressBar, transition, autoclose, position){
        toast.success(String(text), {
          theme: theme || 'auto',
          dangerouslyHTMLString: dangerouslyHTMLString,
          icon: icon,
          hideProgressBar: hideProgressBar,
          transition: transition,
          autoClose: autoclose,
          position: position,
        })
      },
      infoToast(text, dangerouslyHTMLString, theme, icon, hideProgressBar, transition, autoclose, position){
        toast.info(String(text), {
          theme: theme || 'auto',
          dangerouslyHTMLString: dangerouslyHTMLString,
          icon: icon,
          hideProgressBar: hideProgressBar,
          transition: transition,
          autoClose: autoclose,
          position: position,
        })
      },
      warningToast(text, dangerouslyHTMLString, theme, icon, hideProgressBar, transition, autoclose, position){
        toast.warning(String(text), {
          theme: theme || 'auto',
          dangerouslyHTMLString: dangerouslyHTMLString,
          icon: icon,
          hideProgressBar: hideProgressBar,
          transition: transition,
          autoClose: autoclose,
          position: position,
        });
      },
      errorToast(text, dangerouslyHTMLString, theme, icon, hideProgressBar, transition, autoclose, position){
        toast.error(String(text), {
          theme: theme || 'auto',
          dangerouslyHTMLString: dangerouslyHTMLString,
          icon: icon,
          hideProgressBar: hideProgressBar,
          transition: transition,
          autoClose: autoclose,
          position: position,
        });
      },
    }
  }

</script>

<style>
</style>
