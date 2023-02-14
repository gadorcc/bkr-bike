import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    minDate: "today",
  })
}

export { initFlatpickr };
