"use client";
import React, { useState, useEffect } from "react";
import moment from "moment";

import { PurposeShow } from "@/components/purpose/show";
import { PurposeNew } from "@/components/purpose/new";
import { PurposeNew } from ./Row";


import {
  Box,
  Checkbox,
  IconButton,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Typography,
  Paper,
  Menu,
  MenuItem,
  Button,
  Stack,
} from "@mui/material";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import KeyboardArrowUpIcon from "@mui/icons-material/KeyboardArrowUp";
import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";
import CloseIcon from "@mui/icons-material/Close";

import {
  PurposeGetData as getData,
  PurposeEdit as Edit,
  PurposeDelete as Delete,
} from "@/lib/api/PurposeDate";

class TasksController < ApplicationController
    before_action :set_task, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
  
    def index
      @tasks =Task.where(user_id: current_api_v1_user.id,)
  
      render json: @tasks
    end
  
    def create
      @task = Task.new(task_params.merge(user_id: current_api_v1_user.id))
  
      if @task.save
        render json: @task, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @task.destroy
    end
  
    private
      def set_task
        @task = Task.find(params[:id])
      end
  
      def task_params
        params.require(:task).permit(:title,:result,:deadline,:body,:completed)
      end
  end
end
