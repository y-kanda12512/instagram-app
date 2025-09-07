document.addEventListener("turbo:load", function () {
    const profileImage = document.getElementById("profileImage");

    if (profileImage) {
        profileImage.addEventListener("click", function () {
            document.getElementById("imageUploadInput").click();
        });

        document.getElementById("imageUploadInput").addEventListener("change", function () {
            document.getElementById("imageUploadForm").submit();
        });
    }
});
