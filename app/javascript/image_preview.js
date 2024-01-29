document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('.photo-input').forEach((inputElement) => {
    const index = inputElement.id.split('_')[1];
    const previewElement = document.getElementById(`preview_${index}`);

    inputElement.addEventListener('change', (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          previewElement.src = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    });
  });
});
