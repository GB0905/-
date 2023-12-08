function selectEmail(ele){
    var $ele = $(ele);
    var $email = $('input[name="joinEmail"]');

    // '1'인 경우 직접입력
    if($ele.val() == "1"){
        $email.attr('readonly', false);
        $email.val('');
    } else {
        $email.attr('readonly', true);
        $email.val($ele.val());
    }
}