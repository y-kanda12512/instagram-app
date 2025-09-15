const getCSRF = () => document.querySelector('meta[name="csrf-token"]')?.getAttribute("content");

const toggleHearts = (postId, hasLiked) => {
    const active = document.querySelector(`.active-heart[data-post-id="${postId}"]`);
    const inactive = document.querySelector(`.inactive-heart[data-post-id="${postId}"]`);
    if (!active || !inactive) return;
    active.classList.toggle("hidden", !hasLiked);
    inactive.classList.toggle("hidden", hasLiked);
};

const getJSON = (url, options = {}) =>
    fetch(url, {
        headers: { Accept: "application/json", "X-CSRF-Token": getCSRF() },
        ...options,
    }).then((r) => r.json());

document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".post-show").forEach((el) => {
        const postId = el.dataset.postId;
        if (!postId) return;
        getJSON(`/posts/${postId}/like`).then(({ hasLiked }) => {
            toggleHearts(postId, hasLiked);
        });
    });

    document.addEventListener("click", async (e) => {
        const heart = e.target.closest(".post__heart");
        if (!heart) return;

        e.preventDefault();
        const postId = heart.dataset.postId;
        if (!postId) return;

        if (heart.classList.contains("active-heart")) {
            await fetch(`/posts/${postId}/like`, {
                method: "DELETE",
                headers: { "X-CSRF-Token": getCSRF() },
            });
            toggleHearts(postId, false);
        } else {
            await fetch(`/posts/${postId}/like`, {
                method: "POST",
                headers: { "X-CSRF-Token": getCSRF() },
            });
            toggleHearts(postId, true);
        }
    });
});
