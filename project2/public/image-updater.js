import Card from "./card.js";

export default class imageUpdate {
    constructor() { }

    static updateAllImages(cards) {
        var i;
        for (i = 0; i < cards.length; i++) {
            //Select element and update image
            //document.getElementById("cell" + i).children[0].src = this.getImagePath(cards[i]);
            console.log(this.getImagePath(cards[i]));
        }
    }

    static getImagePath(card) {
        return "assets/Set_Cards/" + card.number + card.color + card.shape + card.shading + ".jpg";
    }
}
