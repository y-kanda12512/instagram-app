document.addEventListener("DOMContentLoaded", function () {
    console.log("Script loaded");
    // 選択されたファイルの名前を出力する
    const fileInput = document.getElementById("post_post_images");
    const fileList = document.getElementById("file-list");

    fileInput.addEventListener("change", function () {
        const files = fileInput.files;

        if (files.length > 0) {
            Array.from(files).forEach((file) => {
                const fileName = document.createElement("p");

                fileName.textContent = file.name;
                fileList.appendChild(fileName);
            });
        }
    });

    // postのcontentで文字を検知したらPostを押下可能にする
    const postInput = document.getElementById("post_content");
    const postLink = document.getElementById("js-post-link");

    postInput.addEventListener("input", function () {
        const postInputLength = postInput.value.length;

        if (postInputLength > 0) {
            postLink.classList.remove("post-link-inactive");
        } else {
            postLink.classList.add("post-link-inactive");
        }
    });

    // PostをクリックしたらフォームのSubmitが動作するようにする
    const formSubmit = document.getElementById("js-form-submit");

    postLink.addEventListener("click", function () {
        formSubmit.click();
    });
});
