<script setup lang="ts">
import { watchEffect } from 'vue'
import { whimsy } from './composables/whimsy'

watchEffect(() => {
  document.body.classList.toggle('whimsy', whimsy.value)
})
</script>

<template>
  <button class="whimsy-toggle" @click="whimsy = !whimsy">
    <span v-if="!whimsy">🪄 whimsy?</span>
    <span v-else>🚫 ok, that's plenty</span>
  </button>

  <template v-if="whimsy">
    <div class="whimsy-marquee">
      <span class="whimsy-marquee-content">
        hands on keys · just a text file and a browser · no builds, no frameworks, no fuss · view source forever · you are the website now ·
      </span>
    </div>
    <span class="whimsy-float" style="left: 3%; top: 14%; animation-delay: 0s">✍️</span>
    <span class="whimsy-float" style="left: 93%; top: 16%; animation-delay: 1.2s">🌐</span>
    <span class="whimsy-float" style="left: 92%; top: 80%; animation-delay: 0.6s">☕</span>
    <span class="whimsy-float" style="left: 4%; top: 82%; animation-delay: 1.8s">📄</span>
  </template>
</template>

<style scoped>
/* Win95-style beveled button, same construction as the event page toggle */
.whimsy-toggle {
  position: fixed;
  bottom: 0.6rem;
  right: 0.6rem;
  z-index: 100;
  background-color: lightgray;
  border: 1px solid #000;
  border-top-color: #fff;
  border-left-color: #fff;
  box-shadow: 1px 1px 0 0 #000, -1px -1px 0 0 #dfdfdf;
  font-family: 'Times New Roman', Times, serif;
  font-weight: bold;
  font-size: 0.8rem;
  color: #111;
  padding: 4px 12px;
  cursor: pointer;
  user-select: none;
}

.whimsy-toggle:active {
  border-color: #fff;
  border-top-color: #000;
  border-left-color: #000;
  box-shadow: 1px 1px 0 0 #c0c0c0;
  padding: 5px 11px 3px 13px;
}

.whimsy-marquee {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 90;
  overflow: hidden;
  white-space: nowrap;
  color: red;
  background: #f9f9f9;
  border-bottom: 1px solid #ddd;
  font-family: 'Times New Roman', Times, serif;
  font-size: 1rem;
  pointer-events: none;
}

.whimsy-marquee-content {
  display: inline-block;
  padding-left: 100vw;
  animation: whimsy-scroll 18s linear infinite;
}

@keyframes whimsy-scroll {
  to {
    transform: translateX(-100%);
  }
}

.whimsy-float {
  position: fixed;
  z-index: 90;
  font-size: 1.6rem;
  pointer-events: none;
  animation: whimsy-bob 3s ease-in-out infinite;
}

@keyframes whimsy-bob {
  0%,
  100% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(-12px);
  }
}
</style>
