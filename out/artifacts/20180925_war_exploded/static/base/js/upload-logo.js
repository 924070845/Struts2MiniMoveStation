//上传照片脚本
//获取上传按钮
var input1 = document.getElementById("upload");
if (typeof FileReader === 'undefined') {
    input1.setAttribute('disabled', 'disabled');
} else {
    input1.addEventListener('change', readFile, false);
}
function readFile() {
    var file = this.files[0];//获取上传文件列表中第一个文件
    if (!/image\/\w+/.test(file.type)) {
        //图片文件的type值为image/png或image/jpg
        alert("文件必须为图片！");
        return false;
    }
    var reader = new FileReader();//实例一个文件对象
    reader.readAsDataURL(file);//把上传的文件转换成url
    reader.onload = function (e) {
        var image = new Image();
        image.src = e.target.result;
        var max = 200;
        image.onload = function () {
            var canvas = document.getElementById("cvs");
            var ctx = canvas.getContext("2d");
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.drawImage(image, 0, 0, 200, 285);
        };
    }
};
