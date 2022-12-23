document.addEventListener('turbolinks:load', ()=> {
  const bug = "Resolved"
  const feature = "Completed"
  const bugType = document.getElementById("bug_bugtype")
  const bugStatus = document.getElementById('bug_status')
  console.log(bugStatus.options[0].value)
  bugType.addEventListener('change', function(){
    let bugTypeValue = this.value
    if(bugTypeValue === "Feature"){
      bugStatus.options[2].value = feature
      bugStatus.options[2].innerText = feature
    }
    else
      {
        bugStatus.options[2].value = bug
        bugStatus.options[2].innerText = bug
      }
  })
})

