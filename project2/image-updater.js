
class Test {
    constructor() { }

    updateAllImages(cards) {
        var i;
        for (i = 0; i < cards.length; i++) {
            //Select element and update image
            document.getElementById("cell" + i).children[0].src = this.getImagePath(cards[i]);
        }
    }

    getImagePath(card) {
        return "assets/Set Cards/" + card.return_card() + ".jpg";
    }
}
