export default class imageUpdate {
    constructor() { }

    static updateAllImages(cards) {
        var i;
        for (i = 0; i < cards.length; i++) {
            //Select element and update image//
            var cell = document.getElementById("cell" + i.toString(16)).children[0];
            cell.src = this.getImagePath(cards[i]);
        }
    }

    static getImagePath(card) {

        var answer = "";
        var ext = ".png";

        if (card.shading === "<") {

            answer = "http://localhost:8000/assets/Set_Cards/" + card.number + card.color + card.shape + "%3C" + ext;


        } else {

            answer = "http://localhost:8000/assets/Set_Cards/" + card.number + card.color + card.shape + card.shading + ext;


        }


        return answer;


    }

}
