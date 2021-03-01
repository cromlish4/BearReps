
export default class Card {
    constructor(quantity, color, shading, shape) {
        this._color = color;
        this._shape = shape;
        this._shading = shading;
        this._quantity = quantity;
    }

    /**
     * @returns this instances number
     */
    get number() {
        return this._quantity;
    }

    /**
     * @returns this instances color
     */
    get color() {
        return this._color;
    }

    /**
     * @returns this instances shape 
     */
    get shape() {
        return this._shape;
    }

    /**
     * @returns this instances shading 
     */
    get shading() {
        return this._shading;
    }

    /**
     * @returns an array of number attributes
     */
    static getNumbers() {
        return [1, 2, 3];
    }

    /**
     * @returns an array of color attributes
     */
    static getColors() {
        return ["R", "G", "P"];
    }

    /**
     * @returns an array of shape attributes
     */
    static getShapes() {
        return ["*", "0", "~"];
    }

    /**
     * @returns an array of shading attributes
     */
    static getShadingTypes() {
        return ["-", "<", "%"];
    }

    /**
     * Used to get the card name in a single string. 
     * Useful for getting the image path.
     * @returns Card attributes in a single string
     */
    return_card() {
        return (this._quantity + this._color + this._shading + this._shape);
    }
}
