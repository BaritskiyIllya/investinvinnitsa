function initDatetimePicker(container, time){
    $(container).datetimepicker({
        locale: 'uk',
        sideBySide: true,
        format: 'DD.MM.YYYY H:mm',
        useCurrent: false
    }).data('DateTimePicker').date(moment(time, 'DD.MM.YYYY - H:mm'));
}

function initDatetimePickerEmpty(container){
    $(container).datetimepicker({
        locale: 'uk',
        sideBySide: true,
        format: 'DD.MM.YYYY',
        useCurrent: false
    });
}

function initDatePicker(container, date){
    $(container).datetimepicker({
        locale: 'uk',
        sideBySide: true,
        format: 'DD.MM.YYYY',
        useCurrent: false
    }).data('DateTimePicker').date(moment(date, 'YYYY-MM-DD'));
}

function initMonthYearPicker(container, date) {
    $(container).datetimepicker({
        locale: 'uk',
        sideBySide: true,
        format: 'MM/YYYY',
        useCurrent: false
    }).data('DateTimePicker').date(moment(date, 'YYYY/MM'));
}

function initYearPicker(container, date) {
    $(container).datetimepicker({
        locale: 'uk',
        sideBySide: true,
        format: 'YYYY',
        useCurrent: false
    }).data('DateTimePicker').date(moment(date, 'YYYY'));
}
