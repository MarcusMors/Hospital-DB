'use strict';

const { response } = require('express');
const express = require('express');
const morgan = require('morgan');
const router = express.Router();

const {
  compareMsg,
  singUser,
  mainPage,
  patientsList,
  createUser,
  deleteUser,
} = require('../controllers/index.controller');

//Login page
router.get('/', singUser);
router.post('/', compareMsg);

//Main page
router.get('/contact', mainPage);

//Patients page
router.get('/patients', patientsList);

//Edit patients page
router.post('/add', createUser);

//Delete page
router.get('/delete/:id', deleteUser);

module.exports = router;
