<template>
  <slick
    ref="slick"
    :options="slickOptions"
    @afterChange="handleAfterChange"
    @beforeChange="handleBeforeChange"
    @breakpoint="handleBreakpoint"
    @destroy="handleDestroy"
    @edge="handleEdge"
    @init="handleInit"
    @reInit="handleReInit"
    @setPosition="handleSetPosition"
    @swipe="handleSwipe"
    @lazyLoaded="handleLazyLoaded"
    @lazyLoadError="handleLazeLoadError">
    <slot></slot>
  </slick>
</template>

<script>
  import Slick from 'vue-slick';

  export default {
    name: "Slider",
    components: {Slick},
    data() {
      return {
        slickOptions: {
          slidesToShow: 1,
          infinite: false,
          adaptiveHeight: true,
          autoplay: true,
          speed: 500,
          arrows: false,
          // prevArrow:"<div class='btn btn-primary'></div>",
          // nextArrow:"<div class='btn secondary'></div>",
          // Any other options that can be got from plugin documentation
        },
      };
    },
    methods: {
      next() {
        this.$refs.slick.next();
      },

      prev() {
        this.$refs.slick.prev();
      },

      reInit() {
        // Helpful if you have to deal with v-for to update dynamic lists
        this.$nextTick(() => {
          this.$refs.slick.reSlick();
        });
      },

      // Events listeners
      handleAfterChange(event, slick, currentSlide) {
        console.log('handleAfterChange', event, slick, currentSlide);
      },
      handleBeforeChange(event, slick, currentSlide, nextSlide) {
        console.log('handleBeforeChange', event, slick, currentSlide, nextSlide);
      },
      handleBreakpoint(event, slick, breakpoint) {
        console.log('handleBreakpoint', event, slick, breakpoint);
      },
      handleDestroy(event, slick) {
        console.log('handleDestroy', event, slick);
      },
      handleEdge(event, slick, direction) {
        console.log('handleEdge', event, slick, direction);
      },
      handleInit(event, slick) {
        console.log('handleInit', event, slick);
      },
      handleReInit(event, slick) {
        console.log('handleReInit', event, slick);
      },
      handleSetPosition(event, slick) {
        console.log('handleSetPosition', event, slick);
      },
      handleSwipe(event, slick, direction) {
        console.log('handleSwipe', event, slick, direction);
      },
      handleLazyLoaded(event, slick, image, imageSource) {
        console.log('handleLazyLoaded', event, slick, image, imageSource);
      },
      handleLazeLoadError(event, slick, image, imageSource) {
        console.log('handleLazeLoadError', event, slick, image, imageSource);
      },
    }
  }
</script>

<style>

  @import '../../node_modules/slick-carousel/slick/slick.css';

  .slick-initialized .slick-list .slick-slide > div {
    height: 500px;
  }

  .slider-container {
    display: flex !important;
    justify-content: center;
    align-items: center;
    flex-direction: column;

  h1 {
    display: block;
  }

  }
</style>
