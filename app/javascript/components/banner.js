import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
  strings: ["Welcohol", "Welcome to ::Drinker"], typeSpeed: 80, loop: true  }
  );
}

export { loadDynamicBannerText };

