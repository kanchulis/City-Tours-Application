import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080/reviews"
});

export default {
    getReviews(id) {
        return http.get(`/${id}`);
    },

    createReview(review) {
        return http.post('/add', review);
    }


}