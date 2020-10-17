import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080/landmarks"
});

export default {
    getLandmarks(){
        return http.get('/all');
    },
   
    createLandmark(landmark) {
        return http.post('/add', landmark);
    },

    getOneLandmark(id) {
        return http.get(`/${id}`);
    },

    pendingLandmarks() {
        return http.get('/pending');
    },

    landmarkThumbsUp(id) {
        return http.get(`/thumbsUp/${id}`)
    },

    landmarkThumbsDown(id) {
        return http.get(`/thumbsDown/${id}`)
    }

    }
