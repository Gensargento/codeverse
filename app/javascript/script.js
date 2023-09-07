const ctx = document.getElementById("myChart");

new Chart(ctx, {
  type: "doughnut",
  data: {
    labels: ["Finished", "ongoing", "Stalled"],
    datasets: [
      {
        label: "# of Votes",
        data: [2, 2, 1],
        borderWidth: 1,
      },
    ],
  },
});

const lesson = document.querySelectorAll(".lesson");

const displayLesson = (values) => {
  lesson.forEach((element) => {
    element.style.display = "none";
    const title = element.querySelector("h2").innerHTML.toUpperCase();
    const status = element.datasets.status.toUpperCase();
    const job_type = element.children[3].innerHTML.toUpperCase();

    if (title.includes(values)) {
      element.style.display = "block";
    } else if (title.includes(values)) {
      element.style.display = "block";
    }
  });
};

searchLesson.addEventListener("input", (e) => {
  displayLesson(e.target.value.toUpperCase());
});

lessonFilter.addEventListener("input", (e) => {
  displayLesson(e.target.value.toUpperCase());
});
