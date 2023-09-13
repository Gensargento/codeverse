const ctx = document.getElementById("myChart");
const finishedLessons = document.getElementById("finished").innerHTML;  
const ongoingLessons = document.getElementById("ongoing").innerHTML;
console.log(finishedLessons);

new Chart(ctx, {
  type: "doughnut",
  data: {
    labels: ["Finished", "Ongoing", "Stalled"],
    datasets: [
      {
        label: "# of Votes",
        data: [finishedLessons, ongoingLessons, 0],
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
