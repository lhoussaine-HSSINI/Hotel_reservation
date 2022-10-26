(function() {
    const forms = document.querySelectorAll('.needs-validation');
    for (let form of forms) {
        form.addEventListener(
            'submit',
            function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    form.classList.add('was-validated');
                }
            },
            false
        );
    }
})();


let DbFileName ="";
let list_mage = "";

function get_list_image(id, index) {
    var name_id ="table_aimage".concat(id);
    DbFileName = document.getElementsByName(name_id)[0].value;
    list_mage = DbFileName.split("+");
    let img = document.querySelector("#change_image".concat(id));
    img.setAttribute("src","images/".concat(list_mage[index]))
}

function setmin_date_residence_date(id) {
    var currentDate = new Date().toISOString().slice(0, -8); //yyyy-MM-ddThh:mm
    document.querySelector("#residence_date".concat(id)).min = currentDate;
    document.querySelector("#residence_date".concat(id)).value = currentDate;
    // document.querySelector("#exit_date".concat(id)).min = currentDate;
    console.log(currentDate)
}
function setmin_date_exit_date(id) {
        var currentDate = new Date().toISOString().slice(0, -8); //yyyy-MM-ddThh:mm
        document.querySelector("#exit_date".concat(id)).min = currentDate;
        document.querySelector("#exit_date".concat(id)).value = currentDate;
}

function calculate_days(id) {

    const date1 = new Date(document.querySelector("#residence_date".concat(id)).value);
    const date2 = new Date(document.querySelector("#exit_date".concat(id)).value);
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    document.querySelector("#days_reserve").value=diffDays;
}

