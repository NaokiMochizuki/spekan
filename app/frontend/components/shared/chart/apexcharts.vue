<template>
    <VueApexCharts :width="width || '100%'" :ref="refs || 'apexchart'" :height="height" :type="type" :options="options"
        :series="series" />
</template>
<script>
import VueApexCharts from "vue3-apexcharts";
export default {
    props: ['width', 'height', 'type', 'options', 'series', 'refs'],
    components: {
        VueApexCharts
    }
}
</script>

