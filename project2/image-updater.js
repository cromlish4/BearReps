
function updateAllImages(cards) {
    var i;
    for (i = 0; i < cards.length; i++) {
        //Select element and update image
        document.getElementById("cell" + i).children[0].src = getImagePath(cards[i]);
    }
}

function getImagePath(card) {

    //Must parse from return_card since Card doesn't technically have getters for the current attributes set
    var cardStringForm = card.return_card();
    var number = cardStringForm.charAt(0);
    var color = cardStringForm.charAt(1);
    var shading = cardStringForm.charAt(2);
    var shape = cardStringForm.charAt(3);
    //TODO, discuss wt, possibly move all cards into one folder to remove this step
    var additionalPath = "Green/";
    if (color == "R")
        additionalPath = "Red/";
    else if (color == "P")
        additionalPath = "Purple/";

    //TODO, discuss wt, you can't really name files with a "/", changing Card to have "%" instead of "/" would remove this step
    if (shading == "/")
        shading = "%";

    return "assets/Set Cards/" + additionalPath + number + color + shape + shading;
}